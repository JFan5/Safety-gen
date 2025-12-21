(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v6 ?v3)
             (pred_1 ?v8 ?v7)
             (pred_9 ?v6 ?v7)
             (pred_11 ?v2 ?v6 )
	     (pred_7 ?v6)
             (pred_10 ?v9)
             (pred_4 ?v8)
             (pred_8 ?v7)
             (pred_3 ?v6)
             (pred_12 ?v8)
             (pred_6 ?v6)
             (pred_5 ))



(:action op_2
:parameters (?v10 ?v12 ?v5 ?v11)
:precondition (and (pred_10 ?v10) (pred_10 ?v12) (pred_4 ?v5) (pred_8 ?v11)
          (pred_2 ?v10 ?v12) (pred_1 ?v5 ?v11)
                   (pred_9 ?v12 ?v11) (pred_7 ?v10) 
                   (pred_3 ?v12) (pred_12 ?v5))
:effect (and  (pred_6 ?v12) (not (pred_3 ?v12))))


(:action op_1
:parameters (?v10 ?v4)
:precondition (and (pred_10 ?v10) (pred_10 ?v4)
               (pred_7 ?v10) (pred_2 ?v10 ?v4) (pred_6 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v10))))

(:action op_5
:parameters (?v10 ?v5)
:precondition (and (pred_10 ?v10) (pred_4 ?v5) 
                  (pred_7 ?v10) (pred_11 ?v5 ?v10) (pred_5 ))
:effect (and (pred_12 ?v5)
   (not (pred_11 ?v5 ?v10)) (not (pred_5 ))))


(:action op_4
:parameters (?v10 ?v13 ?v1)
:precondition (and (pred_10 ?v10) (pred_4 ?v13) (pred_4 ?v1)
                  (pred_7 ?v10) (pred_12 ?v1) (pred_11 ?v13 ?v10))
:effect (and (pred_12 ?v13) (pred_11 ?v1 ?v10)
        (not (pred_12 ?v1)) (not (pred_11 ?v13 ?v10))))

(:action op_3
:parameters (?v10 ?v5)
:precondition (and (pred_10 ?v10) (pred_4 ?v5) 
                  (pred_7 ?v10) (pred_12 ?v5))
:effect (and (pred_5 ) (pred_11 ?v5 ?v10) (not (pred_12 ?v5)))))


	
