(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v9 ?v11)
             (pred_9 ?v5 ?v6)
             (pred_5 ?v9 ?v6)
             (pred_6 ?v13 ?v9 )
	     (pred_3 ?v9)
             (pred_4 ?v2)
             (pred_11 ?v5)
             (pred_7 ?v6)
             (pred_10 ?v9)
             (pred_1 ?v5)
             (pred_8 ?v9)
             (pred_12 ))



(:action op_1
:parameters (?v10 ?v7 ?v8 ?v1)
:precondition (and (pred_4 ?v10) (pred_4 ?v7) (pred_11 ?v8) (pred_7 ?v1)
          (pred_2 ?v10 ?v7) (pred_9 ?v8 ?v1)
                   (pred_5 ?v7 ?v1) (pred_3 ?v10) 
                   (pred_10 ?v7) (pred_1 ?v8))
:effect (and  (pred_8 ?v7) (not (pred_10 ?v7))))


(:action op_2
:parameters (?v10 ?v12)
:precondition (and (pred_4 ?v10) (pred_4 ?v12)
               (pred_3 ?v10) (pred_2 ?v10 ?v12) (pred_8 ?v12))
:effect (and (pred_3 ?v12) (not (pred_3 ?v10))))

(:action op_5
:parameters (?v10 ?v8)
:precondition (and (pred_4 ?v10) (pred_11 ?v8) 
                  (pred_3 ?v10) (pred_6 ?v8 ?v10) (pred_12 ))
:effect (and (pred_1 ?v8)
   (not (pred_6 ?v8 ?v10)) (not (pred_12 ))))


(:action op_4
:parameters (?v10 ?v3 ?v4)
:precondition (and (pred_4 ?v10) (pred_11 ?v3) (pred_11 ?v4)
                  (pred_3 ?v10) (pred_1 ?v4) (pred_6 ?v3 ?v10))
:effect (and (pred_1 ?v3) (pred_6 ?v4 ?v10)
        (not (pred_1 ?v4)) (not (pred_6 ?v3 ?v10))))

(:action op_3
:parameters (?v10 ?v8)
:precondition (and (pred_4 ?v10) (pred_11 ?v8) 
                  (pred_3 ?v10) (pred_1 ?v8))
:effect (and (pred_12 ) (pred_6 ?v8 ?v10) (not (pred_1 ?v8)))))


	
