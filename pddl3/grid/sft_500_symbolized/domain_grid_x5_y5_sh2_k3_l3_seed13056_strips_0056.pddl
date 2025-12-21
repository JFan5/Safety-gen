(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v3 ?v10)
             (pred_12 ?v7 ?v9)
             (pred_10 ?v3 ?v9)
             (pred_3 ?v1 ?v3 )
	     (pred_8 ?v3)
             (pred_7 ?v2)
             (pred_11 ?v7)
             (pred_9 ?v9)
             (pred_6 ?v3)
             (pred_1 ?v7)
             (pred_5 ?v3)
             (pred_4 ))



(:action op_4
:parameters (?v8 ?v13 ?v12 ?v4)
:precondition (and (pred_7 ?v8) (pred_7 ?v13) (pred_11 ?v12) (pred_9 ?v4)
          (pred_2 ?v8 ?v13) (pred_12 ?v12 ?v4)
                   (pred_10 ?v13 ?v4) (pred_8 ?v8) 
                   (pred_6 ?v13) (pred_1 ?v12))
:effect (and  (pred_5 ?v13) (not (pred_6 ?v13))))


(:action op_3
:parameters (?v8 ?v5)
:precondition (and (pred_7 ?v8) (pred_7 ?v5)
               (pred_8 ?v8) (pred_2 ?v8 ?v5) (pred_5 ?v5))
:effect (and (pred_8 ?v5) (not (pred_8 ?v8))))

(:action op_1
:parameters (?v8 ?v12)
:precondition (and (pred_7 ?v8) (pred_11 ?v12) 
                  (pred_8 ?v8) (pred_3 ?v12 ?v8) (pred_4 ))
:effect (and (pred_1 ?v12)
   (not (pred_3 ?v12 ?v8)) (not (pred_4 ))))


(:action op_5
:parameters (?v8 ?v11 ?v6)
:precondition (and (pred_7 ?v8) (pred_11 ?v11) (pred_11 ?v6)
                  (pred_8 ?v8) (pred_1 ?v6) (pred_3 ?v11 ?v8))
:effect (and (pred_1 ?v11) (pred_3 ?v6 ?v8)
        (not (pred_1 ?v6)) (not (pred_3 ?v11 ?v8))))

(:action op_2
:parameters (?v8 ?v12)
:precondition (and (pred_7 ?v8) (pred_11 ?v12) 
                  (pred_8 ?v8) (pred_1 ?v12))
:effect (and (pred_4 ) (pred_3 ?v12 ?v8) (not (pred_1 ?v12)))))


	
