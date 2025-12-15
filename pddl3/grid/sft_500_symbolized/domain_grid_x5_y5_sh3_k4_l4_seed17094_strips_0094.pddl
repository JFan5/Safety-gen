(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v5)
             (pred_5 ?v1 ?v10)
             (pred_11 ?v2 ?v10)
             (pred_9 ?v8 ?v2 )
	     (pred_12 ?v2)
             (pred_1 ?v12)
             (pred_2 ?v1)
             (pred_6 ?v10)
             (pred_10 ?v2)
             (pred_7 ?v1)
             (pred_8 ?v2)
             (pred_3 ))



(:action op_4
:parameters (?v9 ?v6 ?v13 ?v7)
:precondition (and (pred_1 ?v9) (pred_1 ?v6) (pred_2 ?v13) (pred_6 ?v7)
          (pred_4 ?v9 ?v6) (pred_5 ?v13 ?v7)
                   (pred_11 ?v6 ?v7) (pred_12 ?v9) 
                   (pred_10 ?v6) (pred_7 ?v13))
:effect (and  (pred_8 ?v6) (not (pred_10 ?v6))))


(:action op_3
:parameters (?v9 ?v11)
:precondition (and (pred_1 ?v9) (pred_1 ?v11)
               (pred_12 ?v9) (pred_4 ?v9 ?v11) (pred_8 ?v11))
:effect (and (pred_12 ?v11) (not (pred_12 ?v9))))

(:action op_1
:parameters (?v9 ?v13)
:precondition (and (pred_1 ?v9) (pred_2 ?v13) 
                  (pred_12 ?v9) (pred_9 ?v13 ?v9) (pred_3 ))
:effect (and (pred_7 ?v13)
   (not (pred_9 ?v13 ?v9)) (not (pred_3 ))))


(:action op_5
:parameters (?v9 ?v4 ?v3)
:precondition (and (pred_1 ?v9) (pred_2 ?v4) (pred_2 ?v3)
                  (pred_12 ?v9) (pred_7 ?v3) (pred_9 ?v4 ?v9))
:effect (and (pred_7 ?v4) (pred_9 ?v3 ?v9)
        (not (pred_7 ?v3)) (not (pred_9 ?v4 ?v9))))

(:action op_2
:parameters (?v9 ?v13)
:precondition (and (pred_1 ?v9) (pred_2 ?v13) 
                  (pred_12 ?v9) (pred_7 ?v13))
:effect (and (pred_3 ) (pred_9 ?v13 ?v9) (not (pred_7 ?v13)))))


	
