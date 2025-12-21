(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_4 ?v2 ?v1)
             (pred_7 ?v4 ?v8)
             (pred_9 ?v2 ?v8)
             (pred_2 ?v10 ?v2 )
	     (pred_10 ?v2)
             (pred_11 ?v9)
             (pred_1 ?v4)
             (pred_3 ?v8)
             (pred_12 ?v2)
             (pred_8 ?v4)
             (pred_5 ?v2)
             (pred_6 ))



(:action op_4
:parameters (?v12 ?v11 ?v3 ?v5)
:precondition (and (pred_11 ?v12) (pred_11 ?v11) (pred_1 ?v3) (pred_3 ?v5)
          (pred_4 ?v12 ?v11) (pred_7 ?v3 ?v5)
                   (pred_9 ?v11 ?v5) (pred_10 ?v12) 
                   (pred_12 ?v11) (pred_8 ?v3))
:effect (and  (pred_5 ?v11) (not (pred_12 ?v11))))


(:action op_1
:parameters (?v12 ?v13)
:precondition (and (pred_11 ?v12) (pred_11 ?v13)
               (pred_10 ?v12) (pred_4 ?v12 ?v13) (pred_5 ?v13))
:effect (and (pred_10 ?v13) (not (pred_10 ?v12))))

(:action op_3
:parameters (?v12 ?v3)
:precondition (and (pred_11 ?v12) (pred_1 ?v3) 
                  (pred_10 ?v12) (pred_2 ?v3 ?v12) (pred_6 ))
:effect (and (pred_8 ?v3)
   (not (pred_2 ?v3 ?v12)) (not (pred_6 ))))


(:action op_2
:parameters (?v12 ?v6 ?v7)
:precondition (and (pred_11 ?v12) (pred_1 ?v6) (pred_1 ?v7)
                  (pred_10 ?v12) (pred_8 ?v7) (pred_2 ?v6 ?v12))
:effect (and (pred_8 ?v6) (pred_2 ?v7 ?v12)
        (not (pred_8 ?v7)) (not (pred_2 ?v6 ?v12))))

(:action op_5
:parameters (?v12 ?v3)
:precondition (and (pred_11 ?v12) (pred_1 ?v3) 
                  (pred_10 ?v12) (pred_8 ?v3))
:effect (and (pred_6 ) (pred_2 ?v3 ?v12) (not (pred_8 ?v3)))))


	
