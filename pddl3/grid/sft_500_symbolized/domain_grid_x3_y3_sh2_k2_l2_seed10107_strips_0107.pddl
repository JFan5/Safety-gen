(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v6 ?v4)
             (pred_2 ?v1 ?v8)
             (pred_9 ?v6 ?v8)
             (pred_10 ?v11 ?v6 )
	     (pred_11 ?v6)
             (pred_8 ?v9)
             (pred_12 ?v1)
             (pred_7 ?v8)
             (pred_5 ?v6)
             (pred_3 ?v1)
             (pred_1 ?v6)
             (pred_6 ))



(:action op_3
:parameters (?v10 ?v2 ?v13 ?v3)
:precondition (and (pred_8 ?v10) (pred_8 ?v2) (pred_12 ?v13) (pred_7 ?v3)
          (pred_4 ?v10 ?v2) (pred_2 ?v13 ?v3)
                   (pred_9 ?v2 ?v3) (pred_11 ?v10) 
                   (pred_5 ?v2) (pred_3 ?v13))
:effect (and  (pred_1 ?v2) (not (pred_5 ?v2))))


(:action op_5
:parameters (?v10 ?v12)
:precondition (and (pred_8 ?v10) (pred_8 ?v12)
               (pred_11 ?v10) (pred_4 ?v10 ?v12) (pred_1 ?v12))
:effect (and (pred_11 ?v12) (not (pred_11 ?v10))))

(:action op_4
:parameters (?v10 ?v13)
:precondition (and (pred_8 ?v10) (pred_12 ?v13) 
                  (pred_11 ?v10) (pred_10 ?v13 ?v10) (pred_6 ))
:effect (and (pred_3 ?v13)
   (not (pred_10 ?v13 ?v10)) (not (pred_6 ))))


(:action op_1
:parameters (?v10 ?v7 ?v5)
:precondition (and (pred_8 ?v10) (pred_12 ?v7) (pred_12 ?v5)
                  (pred_11 ?v10) (pred_3 ?v5) (pred_10 ?v7 ?v10))
:effect (and (pred_3 ?v7) (pred_10 ?v5 ?v10)
        (not (pred_3 ?v5)) (not (pred_10 ?v7 ?v10))))

(:action op_2
:parameters (?v10 ?v13)
:precondition (and (pred_8 ?v10) (pred_12 ?v13) 
                  (pred_11 ?v10) (pred_3 ?v13))
:effect (and (pred_6 ) (pred_10 ?v13 ?v10) (not (pred_3 ?v13)))))


	
