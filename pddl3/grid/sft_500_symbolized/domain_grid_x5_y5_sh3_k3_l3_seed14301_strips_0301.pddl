(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v9 ?v1)
             (pred_8 ?v6 ?v5)
             (pred_10 ?v9 ?v5)
             (pred_1 ?v13 ?v9 )
	     (pred_3 ?v9)
             (pred_11 ?v12)
             (pred_7 ?v6)
             (pred_4 ?v5)
             (pred_12 ?v9)
             (pred_2 ?v6)
             (pred_6 ?v9)
             (pred_9 ))



(:action op_3
:parameters (?v8 ?v7 ?v10 ?v4)
:precondition (and (pred_11 ?v8) (pred_11 ?v7) (pred_7 ?v10) (pred_4 ?v4)
          (pred_5 ?v8 ?v7) (pred_8 ?v10 ?v4)
                   (pred_10 ?v7 ?v4) (pred_3 ?v8) 
                   (pred_12 ?v7) (pred_2 ?v10))
:effect (and  (pred_6 ?v7) (not (pred_12 ?v7))))


(:action op_2
:parameters (?v8 ?v2)
:precondition (and (pred_11 ?v8) (pred_11 ?v2)
               (pred_3 ?v8) (pred_5 ?v8 ?v2) (pred_6 ?v2))
:effect (and (pred_3 ?v2) (not (pred_3 ?v8))))

(:action op_4
:parameters (?v8 ?v10)
:precondition (and (pred_11 ?v8) (pred_7 ?v10) 
                  (pred_3 ?v8) (pred_1 ?v10 ?v8) (pred_9 ))
:effect (and (pred_2 ?v10)
   (not (pred_1 ?v10 ?v8)) (not (pred_9 ))))


(:action op_1
:parameters (?v8 ?v3 ?v11)
:precondition (and (pred_11 ?v8) (pred_7 ?v3) (pred_7 ?v11)
                  (pred_3 ?v8) (pred_2 ?v11) (pred_1 ?v3 ?v8))
:effect (and (pred_2 ?v3) (pred_1 ?v11 ?v8)
        (not (pred_2 ?v11)) (not (pred_1 ?v3 ?v8))))

(:action op_5
:parameters (?v8 ?v10)
:precondition (and (pred_11 ?v8) (pred_7 ?v10) 
                  (pred_3 ?v8) (pred_2 ?v10))
:effect (and (pred_9 ) (pred_1 ?v10 ?v8) (not (pred_2 ?v10)))))


	
