(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v3 ?v8)
             (pred_11 ?v5 ?v2)
             (pred_9 ?v3 ?v2)
             (pred_2 ?v1 ?v3 )
	     (pred_5 ?v3)
             (pred_12 ?v6)
             (pred_10 ?v5)
             (pred_3 ?v2)
             (pred_6 ?v3)
             (pred_1 ?v5)
             (pred_8 ?v3)
             (pred_7 ))



(:action op_5
:parameters (?v12 ?v11 ?v10 ?v7)
:precondition (and (pred_12 ?v12) (pred_12 ?v11) (pred_10 ?v10) (pred_3 ?v7)
          (pred_4 ?v12 ?v11) (pred_11 ?v10 ?v7)
                   (pred_9 ?v11 ?v7) (pred_5 ?v12) 
                   (pred_6 ?v11) (pred_1 ?v10))
:effect (and  (pred_8 ?v11) (not (pred_6 ?v11))))


(:action op_2
:parameters (?v12 ?v13)
:precondition (and (pred_12 ?v12) (pred_12 ?v13)
               (pred_5 ?v12) (pred_4 ?v12 ?v13) (pred_8 ?v13))
:effect (and (pred_5 ?v13) (not (pred_5 ?v12))))

(:action op_1
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_10 ?v10) 
                  (pred_5 ?v12) (pred_2 ?v10 ?v12) (pred_7 ))
:effect (and (pred_1 ?v10)
   (not (pred_2 ?v10 ?v12)) (not (pred_7 ))))


(:action op_3
:parameters (?v12 ?v4 ?v9)
:precondition (and (pred_12 ?v12) (pred_10 ?v4) (pred_10 ?v9)
                  (pred_5 ?v12) (pred_1 ?v9) (pred_2 ?v4 ?v12))
:effect (and (pred_1 ?v4) (pred_2 ?v9 ?v12)
        (not (pred_1 ?v9)) (not (pred_2 ?v4 ?v12))))

(:action op_4
:parameters (?v12 ?v10)
:precondition (and (pred_12 ?v12) (pred_10 ?v10) 
                  (pred_5 ?v12) (pred_1 ?v10))
:effect (and (pred_7 ) (pred_2 ?v10 ?v12) (not (pred_1 ?v10)))))


	
