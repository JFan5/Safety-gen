(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v6 ?v4)
             (pred_3 ?v5 ?v11)
             (pred_6 ?v6 ?v11)
             (pred_12 ?v9 ?v6 )
	     (pred_2 ?v6)
             (pred_7 ?v7)
             (pred_10 ?v5)
             (pred_4 ?v11)
             (pred_11 ?v6)
             (pred_1 ?v5)
             (pred_9 ?v6)
             (pred_5 ))



(:action op_5
:parameters (?v3 ?v13 ?v8 ?v1)
:precondition (and (pred_7 ?v3) (pred_7 ?v13) (pred_10 ?v8) (pred_4 ?v1)
          (pred_8 ?v3 ?v13) (pred_3 ?v8 ?v1)
                   (pred_6 ?v13 ?v1) (pred_2 ?v3) 
                   (pred_11 ?v13) (pred_1 ?v8))
:effect (and  (pred_9 ?v13) (not (pred_11 ?v13))))


(:action op_1
:parameters (?v3 ?v12)
:precondition (and (pred_7 ?v3) (pred_7 ?v12)
               (pred_2 ?v3) (pred_8 ?v3 ?v12) (pred_9 ?v12))
:effect (and (pred_2 ?v12) (not (pred_2 ?v3))))

(:action op_3
:parameters (?v3 ?v8)
:precondition (and (pred_7 ?v3) (pred_10 ?v8) 
                  (pred_2 ?v3) (pred_12 ?v8 ?v3) (pred_5 ))
:effect (and (pred_1 ?v8)
   (not (pred_12 ?v8 ?v3)) (not (pred_5 ))))


(:action op_4
:parameters (?v3 ?v10 ?v2)
:precondition (and (pred_7 ?v3) (pred_10 ?v10) (pred_10 ?v2)
                  (pred_2 ?v3) (pred_1 ?v2) (pred_12 ?v10 ?v3))
:effect (and (pred_1 ?v10) (pred_12 ?v2 ?v3)
        (not (pred_1 ?v2)) (not (pred_12 ?v10 ?v3))))

(:action op_2
:parameters (?v3 ?v8)
:precondition (and (pred_7 ?v3) (pred_10 ?v8) 
                  (pred_2 ?v3) (pred_1 ?v8))
:effect (and (pred_5 ) (pred_12 ?v8 ?v3) (not (pred_1 ?v8)))))


	
