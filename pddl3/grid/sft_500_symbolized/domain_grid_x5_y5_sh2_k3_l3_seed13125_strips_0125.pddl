(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v8 ?v4)
             (pred_10 ?v11 ?v10)
             (pred_3 ?v8 ?v10)
             (pred_7 ?v6 ?v8 )
	     (pred_4 ?v8)
             (pred_8 ?v5)
             (pred_11 ?v11)
             (pred_12 ?v10)
             (pred_2 ?v8)
             (pred_9 ?v11)
             (pred_5 ?v8)
             (pred_6 ))



(:action op_3
:parameters (?v9 ?v13 ?v7 ?v2)
:precondition (and (pred_8 ?v9) (pred_8 ?v13) (pred_11 ?v7) (pred_12 ?v2)
          (pred_1 ?v9 ?v13) (pred_10 ?v7 ?v2)
                   (pred_3 ?v13 ?v2) (pred_4 ?v9) 
                   (pred_2 ?v13) (pred_9 ?v7))
:effect (and  (pred_5 ?v13) (not (pred_2 ?v13))))


(:action op_1
:parameters (?v9 ?v3)
:precondition (and (pred_8 ?v9) (pred_8 ?v3)
               (pred_4 ?v9) (pred_1 ?v9 ?v3) (pred_5 ?v3))
:effect (and (pred_4 ?v3) (not (pred_4 ?v9))))

(:action op_2
:parameters (?v9 ?v7)
:precondition (and (pred_8 ?v9) (pred_11 ?v7) 
                  (pred_4 ?v9) (pred_7 ?v7 ?v9) (pred_6 ))
:effect (and (pred_9 ?v7)
   (not (pred_7 ?v7 ?v9)) (not (pred_6 ))))


(:action op_5
:parameters (?v9 ?v12 ?v1)
:precondition (and (pred_8 ?v9) (pred_11 ?v12) (pred_11 ?v1)
                  (pred_4 ?v9) (pred_9 ?v1) (pred_7 ?v12 ?v9))
:effect (and (pred_9 ?v12) (pred_7 ?v1 ?v9)
        (not (pred_9 ?v1)) (not (pred_7 ?v12 ?v9))))

(:action op_4
:parameters (?v9 ?v7)
:precondition (and (pred_8 ?v9) (pred_11 ?v7) 
                  (pred_4 ?v9) (pred_9 ?v7))
:effect (and (pred_6 ) (pred_7 ?v7 ?v9) (not (pred_9 ?v7)))))


	
