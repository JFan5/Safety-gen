(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_8 ?v7 ?v3)
             (pred_12 ?v5 ?v1)
             (pred_2 ?v7 ?v1)
             (pred_6 ?v10 ?v7 )
	     (pred_4 ?v7)
             (pred_11 ?v12)
             (pred_10 ?v5)
             (pred_5 ?v1)
             (pred_3 ?v7)
             (pred_1 ?v5)
             (pred_7 ?v7)
             (pred_9 ))



(:action op_3
:parameters (?v2 ?v11 ?v6 ?v9)
:precondition (and (pred_11 ?v2) (pred_11 ?v11) (pred_10 ?v6) (pred_5 ?v9)
          (pred_8 ?v2 ?v11) (pred_12 ?v6 ?v9)
                   (pred_2 ?v11 ?v9) (pred_4 ?v2) 
                   (pred_3 ?v11) (pred_1 ?v6))
:effect (and  (pred_7 ?v11) (not (pred_3 ?v11))))


(:action op_5
:parameters (?v2 ?v4)
:precondition (and (pred_11 ?v2) (pred_11 ?v4)
               (pred_4 ?v2) (pred_8 ?v2 ?v4) (pred_7 ?v4))
:effect (and (pred_4 ?v4) (not (pred_4 ?v2))))

(:action op_2
:parameters (?v2 ?v6)
:precondition (and (pred_11 ?v2) (pred_10 ?v6) 
                  (pred_4 ?v2) (pred_6 ?v6 ?v2) (pred_9 ))
:effect (and (pred_1 ?v6)
   (not (pred_6 ?v6 ?v2)) (not (pred_9 ))))


(:action op_1
:parameters (?v2 ?v13 ?v8)
:precondition (and (pred_11 ?v2) (pred_10 ?v13) (pred_10 ?v8)
                  (pred_4 ?v2) (pred_1 ?v8) (pred_6 ?v13 ?v2))
:effect (and (pred_1 ?v13) (pred_6 ?v8 ?v2)
        (not (pred_1 ?v8)) (not (pred_6 ?v13 ?v2))))

(:action op_4
:parameters (?v2 ?v6)
:precondition (and (pred_11 ?v2) (pred_10 ?v6) 
                  (pred_4 ?v2) (pred_1 ?v6))
:effect (and (pred_9 ) (pred_6 ?v6 ?v2) (not (pred_1 ?v6)))))


	
