(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v5 ?v1)
             (pred_12 ?v11 ?v9)
             (pred_9 ?v5 ?v9)
             (pred_5 ?v13 ?v5 )
	     (pred_11 ?v5)
             (pred_1 ?v2)
             (pred_3 ?v11)
             (pred_10 ?v9)
             (pred_7 ?v5)
             (pred_4 ?v11)
             (pred_2 ?v5)
             (pred_8 ))



(:action op_5
:parameters (?v12 ?v10 ?v3 ?v4)
:precondition (and (pred_1 ?v12) (pred_1 ?v10) (pred_3 ?v3) (pred_10 ?v4)
          (pred_6 ?v12 ?v10) (pred_12 ?v3 ?v4)
                   (pred_9 ?v10 ?v4) (pred_11 ?v12) 
                   (pred_7 ?v10) (pred_4 ?v3))
:effect (and  (pred_2 ?v10) (not (pred_7 ?v10))))


(:action op_2
:parameters (?v12 ?v8)
:precondition (and (pred_1 ?v12) (pred_1 ?v8)
               (pred_11 ?v12) (pred_6 ?v12 ?v8) (pred_2 ?v8))
:effect (and (pred_11 ?v8) (not (pred_11 ?v12))))

(:action op_1
:parameters (?v12 ?v3)
:precondition (and (pred_1 ?v12) (pred_3 ?v3) 
                  (pred_11 ?v12) (pred_5 ?v3 ?v12) (pred_8 ))
:effect (and (pred_4 ?v3)
   (not (pred_5 ?v3 ?v12)) (not (pred_8 ))))


(:action op_4
:parameters (?v12 ?v7 ?v6)
:precondition (and (pred_1 ?v12) (pred_3 ?v7) (pred_3 ?v6)
                  (pred_11 ?v12) (pred_4 ?v6) (pred_5 ?v7 ?v12))
:effect (and (pred_4 ?v7) (pred_5 ?v6 ?v12)
        (not (pred_4 ?v6)) (not (pred_5 ?v7 ?v12))))

(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_1 ?v12) (pred_3 ?v3) 
                  (pred_11 ?v12) (pred_4 ?v3))
:effect (and (pred_8 ) (pred_5 ?v3 ?v12) (not (pred_4 ?v3)))))


	
