(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v8 ?v2)
             (pred_7 ?v5 ?v1)
             (pred_8 ?v8 ?v1)
             (pred_6 ?v3 ?v8 )
	     (pred_11 ?v8)
             (pred_10 ?v13)
             (pred_3 ?v5)
             (pred_12 ?v1)
             (pred_5 ?v8)
             (pred_4 ?v5)
             (pred_1 ?v8)
             (pred_9 ))



(:action op_2
:parameters (?v11 ?v7 ?v9 ?v4)
:precondition (and (pred_10 ?v11) (pred_10 ?v7) (pred_3 ?v9) (pred_12 ?v4)
          (pred_2 ?v11 ?v7) (pred_7 ?v9 ?v4)
                   (pred_8 ?v7 ?v4) (pred_11 ?v11) 
                   (pred_5 ?v7) (pred_4 ?v9))
:effect (and  (pred_1 ?v7) (not (pred_5 ?v7))))


(:action op_5
:parameters (?v11 ?v6)
:precondition (and (pred_10 ?v11) (pred_10 ?v6)
               (pred_11 ?v11) (pred_2 ?v11 ?v6) (pred_1 ?v6))
:effect (and (pred_11 ?v6) (not (pred_11 ?v11))))

(:action op_3
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_3 ?v9) 
                  (pred_11 ?v11) (pred_6 ?v9 ?v11) (pred_9 ))
:effect (and (pred_4 ?v9)
   (not (pred_6 ?v9 ?v11)) (not (pred_9 ))))


(:action op_1
:parameters (?v11 ?v10 ?v12)
:precondition (and (pred_10 ?v11) (pred_3 ?v10) (pred_3 ?v12)
                  (pred_11 ?v11) (pred_4 ?v12) (pred_6 ?v10 ?v11))
:effect (and (pred_4 ?v10) (pred_6 ?v12 ?v11)
        (not (pred_4 ?v12)) (not (pred_6 ?v10 ?v11))))

(:action op_4
:parameters (?v11 ?v9)
:precondition (and (pred_10 ?v11) (pred_3 ?v9) 
                  (pred_11 ?v11) (pred_4 ?v9))
:effect (and (pred_9 ) (pred_6 ?v9 ?v11) (not (pred_4 ?v9)))))


	
