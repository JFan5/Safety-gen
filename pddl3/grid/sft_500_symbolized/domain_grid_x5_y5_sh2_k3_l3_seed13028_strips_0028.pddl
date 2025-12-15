(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_7 ?v4 ?v11)
             (pred_10 ?v1 ?v6)
             (pred_9 ?v4 ?v6)
             (pred_6 ?v5 ?v4 )
	     (pred_4 ?v4)
             (pred_2 ?v9)
             (pred_5 ?v1)
             (pred_3 ?v6)
             (pred_1 ?v4)
             (pred_11 ?v1)
             (pred_12 ?v4)
             (pred_8 ))



(:action op_2
:parameters (?v3 ?v10 ?v8 ?v7)
:precondition (and (pred_2 ?v3) (pred_2 ?v10) (pred_5 ?v8) (pred_3 ?v7)
          (pred_7 ?v3 ?v10) (pred_10 ?v8 ?v7)
                   (pred_9 ?v10 ?v7) (pred_4 ?v3) 
                   (pred_1 ?v10) (pred_11 ?v8))
:effect (and  (pred_12 ?v10) (not (pred_1 ?v10))))


(:action op_5
:parameters (?v3 ?v12)
:precondition (and (pred_2 ?v3) (pred_2 ?v12)
               (pred_4 ?v3) (pred_7 ?v3 ?v12) (pred_12 ?v12))
:effect (and (pred_4 ?v12) (not (pred_4 ?v3))))

(:action op_1
:parameters (?v3 ?v8)
:precondition (and (pred_2 ?v3) (pred_5 ?v8) 
                  (pred_4 ?v3) (pred_6 ?v8 ?v3) (pred_8 ))
:effect (and (pred_11 ?v8)
   (not (pred_6 ?v8 ?v3)) (not (pred_8 ))))


(:action op_3
:parameters (?v3 ?v13 ?v2)
:precondition (and (pred_2 ?v3) (pred_5 ?v13) (pred_5 ?v2)
                  (pred_4 ?v3) (pred_11 ?v2) (pred_6 ?v13 ?v3))
:effect (and (pred_11 ?v13) (pred_6 ?v2 ?v3)
        (not (pred_11 ?v2)) (not (pred_6 ?v13 ?v3))))

(:action op_4
:parameters (?v3 ?v8)
:precondition (and (pred_2 ?v3) (pred_5 ?v8) 
                  (pred_4 ?v3) (pred_11 ?v8))
:effect (and (pred_8 ) (pred_6 ?v8 ?v3) (not (pred_11 ?v8)))))


	
