(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v9 ?v2)
             (pred_3 ?v6 ?v12)
             (pred_4 ?v9 ?v12)
             (pred_2 ?v11 ?v9 )
	     (pred_8 ?v9)
             (pred_9 ?v3)
             (pred_5 ?v6)
             (pred_10 ?v12)
             (pred_6 ?v9)
             (pred_12 ?v6)
             (pred_7 ?v9)
             (pred_11 ))



(:action op_5
:parameters (?v13 ?v1 ?v8 ?v5)
:precondition (and (pred_9 ?v13) (pred_9 ?v1) (pred_5 ?v8) (pred_10 ?v5)
          (pred_1 ?v13 ?v1) (pred_3 ?v8 ?v5)
                   (pred_4 ?v1 ?v5) (pred_8 ?v13) 
                   (pred_6 ?v1) (pred_12 ?v8))
:effect (and  (pred_7 ?v1) (not (pred_6 ?v1))))


(:action op_3
:parameters (?v13 ?v7)
:precondition (and (pred_9 ?v13) (pred_9 ?v7)
               (pred_8 ?v13) (pred_1 ?v13 ?v7) (pred_7 ?v7))
:effect (and (pred_8 ?v7) (not (pred_8 ?v13))))

(:action op_1
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_5 ?v8) 
                  (pred_8 ?v13) (pred_2 ?v8 ?v13) (pred_11 ))
:effect (and (pred_12 ?v8)
   (not (pred_2 ?v8 ?v13)) (not (pred_11 ))))


(:action op_2
:parameters (?v13 ?v10 ?v4)
:precondition (and (pred_9 ?v13) (pred_5 ?v10) (pred_5 ?v4)
                  (pred_8 ?v13) (pred_12 ?v4) (pred_2 ?v10 ?v13))
:effect (and (pred_12 ?v10) (pred_2 ?v4 ?v13)
        (not (pred_12 ?v4)) (not (pred_2 ?v10 ?v13))))

(:action op_4
:parameters (?v13 ?v8)
:precondition (and (pred_9 ?v13) (pred_5 ?v8) 
                  (pred_8 ?v13) (pred_12 ?v8))
:effect (and (pred_11 ) (pred_2 ?v8 ?v13) (not (pred_12 ?v8)))))


	
