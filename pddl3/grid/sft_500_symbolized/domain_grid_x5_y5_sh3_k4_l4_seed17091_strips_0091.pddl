(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v11 ?v5)
             (pred_6 ?v2 ?v4)
             (pred_1 ?v11 ?v4)
             (pred_10 ?v6 ?v11 )
	     (pred_9 ?v11)
             (pred_12 ?v12)
             (pred_2 ?v2)
             (pred_3 ?v4)
             (pred_5 ?v11)
             (pred_8 ?v2)
             (pred_4 ?v11)
             (pred_11 ))



(:action op_1
:parameters (?v1 ?v7 ?v10 ?v9)
:precondition (and (pred_12 ?v1) (pred_12 ?v7) (pred_2 ?v10) (pred_3 ?v9)
          (pred_7 ?v1 ?v7) (pred_6 ?v10 ?v9)
                   (pred_1 ?v7 ?v9) (pred_9 ?v1) 
                   (pred_5 ?v7) (pred_8 ?v10))
:effect (and  (pred_4 ?v7) (not (pred_5 ?v7))))


(:action op_4
:parameters (?v1 ?v8)
:precondition (and (pred_12 ?v1) (pred_12 ?v8)
               (pred_9 ?v1) (pred_7 ?v1 ?v8) (pred_4 ?v8))
:effect (and (pred_9 ?v8) (not (pred_9 ?v1))))

(:action op_2
:parameters (?v1 ?v10)
:precondition (and (pred_12 ?v1) (pred_2 ?v10) 
                  (pred_9 ?v1) (pred_10 ?v10 ?v1) (pred_11 ))
:effect (and (pred_8 ?v10)
   (not (pred_10 ?v10 ?v1)) (not (pred_11 ))))


(:action op_3
:parameters (?v1 ?v3 ?v13)
:precondition (and (pred_12 ?v1) (pred_2 ?v3) (pred_2 ?v13)
                  (pred_9 ?v1) (pred_8 ?v13) (pred_10 ?v3 ?v1))
:effect (and (pred_8 ?v3) (pred_10 ?v13 ?v1)
        (not (pred_8 ?v13)) (not (pred_10 ?v3 ?v1))))

(:action op_5
:parameters (?v1 ?v10)
:precondition (and (pred_12 ?v1) (pred_2 ?v10) 
                  (pred_9 ?v1) (pred_8 ?v10))
:effect (and (pred_11 ) (pred_10 ?v10 ?v1) (not (pred_8 ?v10)))))


	
