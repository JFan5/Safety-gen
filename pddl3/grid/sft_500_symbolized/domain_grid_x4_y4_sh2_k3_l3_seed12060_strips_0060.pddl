(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v10 ?v4)
             (pred_10 ?v2 ?v6)
             (pred_11 ?v10 ?v6)
             (pred_3 ?v13 ?v10 )
	     (pred_12 ?v10)
             (pred_1 ?v11)
             (pred_6 ?v2)
             (pred_9 ?v6)
             (pred_5 ?v10)
             (pred_4 ?v2)
             (pred_8 ?v10)
             (pred_7 ))



(:action op_5
:parameters (?v12 ?v8 ?v7 ?v9)
:precondition (and (pred_1 ?v12) (pred_1 ?v8) (pred_6 ?v7) (pred_9 ?v9)
          (pred_2 ?v12 ?v8) (pred_10 ?v7 ?v9)
                   (pred_11 ?v8 ?v9) (pred_12 ?v12) 
                   (pred_5 ?v8) (pred_4 ?v7))
:effect (and  (pred_8 ?v8) (not (pred_5 ?v8))))


(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_1 ?v12) (pred_1 ?v3)
               (pred_12 ?v12) (pred_2 ?v12 ?v3) (pred_8 ?v3))
:effect (and (pred_12 ?v3) (not (pred_12 ?v12))))

(:action op_2
:parameters (?v12 ?v7)
:precondition (and (pred_1 ?v12) (pred_6 ?v7) 
                  (pred_12 ?v12) (pred_3 ?v7 ?v12) (pred_7 ))
:effect (and (pred_4 ?v7)
   (not (pred_3 ?v7 ?v12)) (not (pred_7 ))))


(:action op_4
:parameters (?v12 ?v1 ?v5)
:precondition (and (pred_1 ?v12) (pred_6 ?v1) (pred_6 ?v5)
                  (pred_12 ?v12) (pred_4 ?v5) (pred_3 ?v1 ?v12))
:effect (and (pred_4 ?v1) (pred_3 ?v5 ?v12)
        (not (pred_4 ?v5)) (not (pred_3 ?v1 ?v12))))

(:action op_3
:parameters (?v12 ?v7)
:precondition (and (pred_1 ?v12) (pred_6 ?v7) 
                  (pred_12 ?v12) (pred_4 ?v7))
:effect (and (pred_7 ) (pred_3 ?v7 ?v12) (not (pred_4 ?v7)))))


	
