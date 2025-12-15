(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v4 ?v13)
             (pred_6 ?v8 ?v3)
             (pred_3 ?v4 ?v3)
             (pred_2 ?v5 ?v4 )
	     (pred_7 ?v4)
             (pred_9 ?v2)
             (pred_11 ?v8)
             (pred_8 ?v3)
             (pred_12 ?v4)
             (pred_10 ?v8)
             (pred_5 ?v4)
             (pred_1 ))



(:action op_3
:parameters (?v12 ?v11 ?v6 ?v10)
:precondition (and (pred_9 ?v12) (pred_9 ?v11) (pred_11 ?v6) (pred_8 ?v10)
          (pred_4 ?v12 ?v11) (pred_6 ?v6 ?v10)
                   (pred_3 ?v11 ?v10) (pred_7 ?v12) 
                   (pred_12 ?v11) (pred_10 ?v6))
:effect (and  (pred_5 ?v11) (not (pred_12 ?v11))))


(:action op_5
:parameters (?v12 ?v9)
:precondition (and (pred_9 ?v12) (pred_9 ?v9)
               (pred_7 ?v12) (pred_4 ?v12 ?v9) (pred_5 ?v9))
:effect (and (pred_7 ?v9) (not (pred_7 ?v12))))

(:action op_2
:parameters (?v12 ?v6)
:precondition (and (pred_9 ?v12) (pred_11 ?v6) 
                  (pred_7 ?v12) (pred_2 ?v6 ?v12) (pred_1 ))
:effect (and (pred_10 ?v6)
   (not (pred_2 ?v6 ?v12)) (not (pred_1 ))))


(:action op_1
:parameters (?v12 ?v7 ?v1)
:precondition (and (pred_9 ?v12) (pred_11 ?v7) (pred_11 ?v1)
                  (pred_7 ?v12) (pred_10 ?v1) (pred_2 ?v7 ?v12))
:effect (and (pred_10 ?v7) (pred_2 ?v1 ?v12)
        (not (pred_10 ?v1)) (not (pred_2 ?v7 ?v12))))

(:action op_4
:parameters (?v12 ?v6)
:precondition (and (pred_9 ?v12) (pred_11 ?v6) 
                  (pred_7 ?v12) (pred_10 ?v6))
:effect (and (pred_1 ) (pred_2 ?v6 ?v12) (not (pred_10 ?v6)))))


	
