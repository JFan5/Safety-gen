(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_11 ?v4 ?v11)
             (pred_10 ?v7 ?v12)
             (pred_1 ?v4 ?v12)
             (pred_4 ?v2 ?v4 )
	     (pred_2 ?v4)
             (pred_3 ?v9)
             (pred_6 ?v7)
             (pred_7 ?v12)
             (pred_5 ?v4)
             (pred_9 ?v7)
             (pred_12 ?v4)
             (pred_8 ))



(:action op_1
:parameters (?v8 ?v13 ?v10 ?v6)
:precondition (and (pred_3 ?v8) (pred_3 ?v13) (pred_6 ?v10) (pred_7 ?v6)
          (pred_11 ?v8 ?v13) (pred_10 ?v10 ?v6)
                   (pred_1 ?v13 ?v6) (pred_2 ?v8) 
                   (pred_5 ?v13) (pred_9 ?v10))
:effect (and  (pred_12 ?v13) (not (pred_5 ?v13))))


(:action op_5
:parameters (?v8 ?v3)
:precondition (and (pred_3 ?v8) (pred_3 ?v3)
               (pred_2 ?v8) (pred_11 ?v8 ?v3) (pred_12 ?v3))
:effect (and (pred_2 ?v3) (not (pred_2 ?v8))))

(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_3 ?v8) (pred_6 ?v10) 
                  (pred_2 ?v8) (pred_4 ?v10 ?v8) (pred_8 ))
:effect (and (pred_9 ?v10)
   (not (pred_4 ?v10 ?v8)) (not (pred_8 ))))


(:action op_2
:parameters (?v8 ?v1 ?v5)
:precondition (and (pred_3 ?v8) (pred_6 ?v1) (pred_6 ?v5)
                  (pred_2 ?v8) (pred_9 ?v5) (pred_4 ?v1 ?v8))
:effect (and (pred_9 ?v1) (pred_4 ?v5 ?v8)
        (not (pred_9 ?v5)) (not (pred_4 ?v1 ?v8))))

(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_3 ?v8) (pred_6 ?v10) 
                  (pred_2 ?v8) (pred_9 ?v10))
:effect (and (pred_8 ) (pred_4 ?v10 ?v8) (not (pred_9 ?v10)))))


	
