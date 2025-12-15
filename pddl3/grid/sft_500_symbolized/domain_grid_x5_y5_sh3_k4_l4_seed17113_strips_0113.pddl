(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v1 ?v2)
             (pred_8 ?v4 ?v10)
             (pred_7 ?v1 ?v10)
             (pred_6 ?v13 ?v1 )
	     (pred_12 ?v1)
             (pred_5 ?v8)
             (pred_11 ?v4)
             (pred_4 ?v10)
             (pred_2 ?v1)
             (pred_10 ?v4)
             (pred_1 ?v1)
             (pred_3 ))



(:action op_1
:parameters (?v11 ?v7 ?v6 ?v3)
:precondition (and (pred_5 ?v11) (pred_5 ?v7) (pred_11 ?v6) (pred_4 ?v3)
          (pred_9 ?v11 ?v7) (pred_8 ?v6 ?v3)
                   (pred_7 ?v7 ?v3) (pred_12 ?v11) 
                   (pred_2 ?v7) (pred_10 ?v6))
:effect (and  (pred_1 ?v7) (not (pred_2 ?v7))))


(:action op_3
:parameters (?v11 ?v5)
:precondition (and (pred_5 ?v11) (pred_5 ?v5)
               (pred_12 ?v11) (pred_9 ?v11 ?v5) (pred_1 ?v5))
:effect (and (pred_12 ?v5) (not (pred_12 ?v11))))

(:action op_2
:parameters (?v11 ?v6)
:precondition (and (pred_5 ?v11) (pred_11 ?v6) 
                  (pred_12 ?v11) (pred_6 ?v6 ?v11) (pred_3 ))
:effect (and (pred_10 ?v6)
   (not (pred_6 ?v6 ?v11)) (not (pred_3 ))))


(:action op_4
:parameters (?v11 ?v12 ?v9)
:precondition (and (pred_5 ?v11) (pred_11 ?v12) (pred_11 ?v9)
                  (pred_12 ?v11) (pred_10 ?v9) (pred_6 ?v12 ?v11))
:effect (and (pred_10 ?v12) (pred_6 ?v9 ?v11)
        (not (pred_10 ?v9)) (not (pred_6 ?v12 ?v11))))

(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_5 ?v11) (pred_11 ?v6) 
                  (pred_12 ?v11) (pred_10 ?v6))
:effect (and (pred_3 ) (pred_6 ?v6 ?v11) (not (pred_10 ?v6)))))


	
