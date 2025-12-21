(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v1 ?v4)
             (pred_5 ?v7 ?v12)
             (pred_8 ?v1 ?v12)
             (pred_1 ?v6 ?v1 )
	     (pred_10 ?v1)
             (pred_2 ?v9)
             (pred_4 ?v7)
             (pred_9 ?v12)
             (pred_3 ?v1)
             (pred_6 ?v7)
             (pred_7 ?v1)
             (pred_11 ))



(:action op_2
:parameters (?v8 ?v13 ?v2 ?v3)
:precondition (and (pred_2 ?v8) (pred_2 ?v13) (pred_4 ?v2) (pred_9 ?v3)
          (pred_12 ?v8 ?v13) (pred_5 ?v2 ?v3)
                   (pred_8 ?v13 ?v3) (pred_10 ?v8) 
                   (pred_3 ?v13) (pred_6 ?v2))
:effect (and  (pred_7 ?v13) (not (pred_3 ?v13))))


(:action op_3
:parameters (?v8 ?v10)
:precondition (and (pred_2 ?v8) (pred_2 ?v10)
               (pred_10 ?v8) (pred_12 ?v8 ?v10) (pred_7 ?v10))
:effect (and (pred_10 ?v10) (not (pred_10 ?v8))))

(:action op_4
:parameters (?v8 ?v2)
:precondition (and (pred_2 ?v8) (pred_4 ?v2) 
                  (pred_10 ?v8) (pred_1 ?v2 ?v8) (pred_11 ))
:effect (and (pred_6 ?v2)
   (not (pred_1 ?v2 ?v8)) (not (pred_11 ))))


(:action op_1
:parameters (?v8 ?v11 ?v5)
:precondition (and (pred_2 ?v8) (pred_4 ?v11) (pred_4 ?v5)
                  (pred_10 ?v8) (pred_6 ?v5) (pred_1 ?v11 ?v8))
:effect (and (pred_6 ?v11) (pred_1 ?v5 ?v8)
        (not (pred_6 ?v5)) (not (pred_1 ?v11 ?v8))))

(:action op_5
:parameters (?v8 ?v2)
:precondition (and (pred_2 ?v8) (pred_4 ?v2) 
                  (pred_10 ?v8) (pred_6 ?v2))
:effect (and (pred_11 ) (pred_1 ?v2 ?v8) (not (pred_6 ?v2)))))


	
