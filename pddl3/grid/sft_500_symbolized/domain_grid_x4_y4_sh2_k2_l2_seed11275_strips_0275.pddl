(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v5 ?v9)
             (pred_1 ?v3 ?v1)
             (pred_3 ?v5 ?v1)
             (pred_12 ?v10 ?v5 )
	     (pred_10 ?v5)
             (pred_11 ?v13)
             (pred_4 ?v3)
             (pred_6 ?v1)
             (pred_5 ?v5)
             (pred_2 ?v3)
             (pred_9 ?v5)
             (pred_7 ))



(:action op_5
:parameters (?v2 ?v11 ?v4 ?v7)
:precondition (and (pred_11 ?v2) (pred_11 ?v11) (pred_4 ?v4) (pred_6 ?v7)
          (pred_8 ?v2 ?v11) (pred_1 ?v4 ?v7)
                   (pred_3 ?v11 ?v7) (pred_10 ?v2) 
                   (pred_5 ?v11) (pred_2 ?v4))
:effect (and  (pred_9 ?v11) (not (pred_5 ?v11))))


(:action op_1
:parameters (?v2 ?v12)
:precondition (and (pred_11 ?v2) (pred_11 ?v12)
               (pred_10 ?v2) (pred_8 ?v2 ?v12) (pred_9 ?v12))
:effect (and (pred_10 ?v12) (not (pred_10 ?v2))))

(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_11 ?v2) (pred_4 ?v4) 
                  (pred_10 ?v2) (pred_12 ?v4 ?v2) (pred_7 ))
:effect (and (pred_2 ?v4)
   (not (pred_12 ?v4 ?v2)) (not (pred_7 ))))


(:action op_3
:parameters (?v2 ?v8 ?v6)
:precondition (and (pred_11 ?v2) (pred_4 ?v8) (pred_4 ?v6)
                  (pred_10 ?v2) (pred_2 ?v6) (pred_12 ?v8 ?v2))
:effect (and (pred_2 ?v8) (pred_12 ?v6 ?v2)
        (not (pred_2 ?v6)) (not (pred_12 ?v8 ?v2))))

(:action op_2
:parameters (?v2 ?v4)
:precondition (and (pred_11 ?v2) (pred_4 ?v4) 
                  (pred_10 ?v2) (pred_2 ?v4))
:effect (and (pred_7 ) (pred_12 ?v4 ?v2) (not (pred_2 ?v4)))))


	
