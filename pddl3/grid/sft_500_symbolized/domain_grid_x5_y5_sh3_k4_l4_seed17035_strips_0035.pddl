(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_9 ?v2 ?v4)
             (pred_4 ?v5 ?v12)
             (pred_5 ?v2 ?v12)
             (pred_2 ?v3 ?v2 )
	     (pred_12 ?v2)
             (pred_6 ?v8)
             (pred_11 ?v5)
             (pred_8 ?v12)
             (pred_7 ?v2)
             (pred_3 ?v5)
             (pred_1 ?v2)
             (pred_10 ))



(:action op_2
:parameters (?v11 ?v7 ?v6 ?v13)
:precondition (and (pred_6 ?v11) (pred_6 ?v7) (pred_11 ?v6) (pred_8 ?v13)
          (pred_9 ?v11 ?v7) (pred_4 ?v6 ?v13)
                   (pred_5 ?v7 ?v13) (pred_12 ?v11) 
                   (pred_7 ?v7) (pred_3 ?v6))
:effect (and  (pred_1 ?v7) (not (pred_7 ?v7))))


(:action op_4
:parameters (?v11 ?v9)
:precondition (and (pred_6 ?v11) (pred_6 ?v9)
               (pred_12 ?v11) (pred_9 ?v11 ?v9) (pred_1 ?v9))
:effect (and (pred_12 ?v9) (not (pred_12 ?v11))))

(:action op_1
:parameters (?v11 ?v6)
:precondition (and (pred_6 ?v11) (pred_11 ?v6) 
                  (pred_12 ?v11) (pred_2 ?v6 ?v11) (pred_10 ))
:effect (and (pred_3 ?v6)
   (not (pred_2 ?v6 ?v11)) (not (pred_10 ))))


(:action op_3
:parameters (?v11 ?v10 ?v1)
:precondition (and (pred_6 ?v11) (pred_11 ?v10) (pred_11 ?v1)
                  (pred_12 ?v11) (pred_3 ?v1) (pred_2 ?v10 ?v11))
:effect (and (pred_3 ?v10) (pred_2 ?v1 ?v11)
        (not (pred_3 ?v1)) (not (pred_2 ?v10 ?v11))))

(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_6 ?v11) (pred_11 ?v6) 
                  (pred_12 ?v11) (pred_3 ?v6))
:effect (and (pred_10 ) (pred_2 ?v6 ?v11) (not (pred_3 ?v6)))))


	
