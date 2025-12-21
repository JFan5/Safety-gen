(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v7 ?v3)
             (pred_8 ?v6 ?v10)
             (pred_6 ?v7 ?v10)
             (pred_2 ?v13 ?v7 )
	     (pred_10 ?v7)
             (pred_5 ?v8)
             (pred_1 ?v6)
             (pred_7 ?v10)
             (pred_9 ?v7)
             (pred_4 ?v6)
             (pred_11 ?v7)
             (pred_3 ))



(:action op_1
:parameters (?v12 ?v11 ?v5 ?v4)
:precondition (and (pred_5 ?v12) (pred_5 ?v11) (pred_1 ?v5) (pred_7 ?v4)
          (pred_12 ?v12 ?v11) (pred_8 ?v5 ?v4)
                   (pred_6 ?v11 ?v4) (pred_10 ?v12) 
                   (pred_9 ?v11) (pred_4 ?v5))
:effect (and  (pred_11 ?v11) (not (pred_9 ?v11))))


(:action op_5
:parameters (?v12 ?v9)
:precondition (and (pred_5 ?v12) (pred_5 ?v9)
               (pred_10 ?v12) (pred_12 ?v12 ?v9) (pred_11 ?v9))
:effect (and (pred_10 ?v9) (not (pred_10 ?v12))))

(:action op_2
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_1 ?v5) 
                  (pred_10 ?v12) (pred_2 ?v5 ?v12) (pred_3 ))
:effect (and (pred_4 ?v5)
   (not (pred_2 ?v5 ?v12)) (not (pred_3 ))))


(:action op_4
:parameters (?v12 ?v2 ?v1)
:precondition (and (pred_5 ?v12) (pred_1 ?v2) (pred_1 ?v1)
                  (pred_10 ?v12) (pred_4 ?v1) (pred_2 ?v2 ?v12))
:effect (and (pred_4 ?v2) (pred_2 ?v1 ?v12)
        (not (pred_4 ?v1)) (not (pred_2 ?v2 ?v12))))

(:action op_3
:parameters (?v12 ?v5)
:precondition (and (pred_5 ?v12) (pred_1 ?v5) 
                  (pred_10 ?v12) (pred_4 ?v5))
:effect (and (pred_3 ) (pred_2 ?v5 ?v12) (not (pred_4 ?v5)))))


	
