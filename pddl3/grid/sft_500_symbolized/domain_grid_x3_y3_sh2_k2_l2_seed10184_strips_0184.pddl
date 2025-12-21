(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_2 ?v1 ?v12)
             (pred_7 ?v8 ?v9)
             (pred_4 ?v1 ?v9)
             (pred_11 ?v5 ?v1 )
	     (pred_3 ?v1)
             (pred_6 ?v13)
             (pred_12 ?v8)
             (pred_1 ?v9)
             (pred_9 ?v1)
             (pred_10 ?v8)
             (pred_8 ?v1)
             (pred_5 ))



(:action op_4
:parameters (?v2 ?v3 ?v6 ?v11)
:precondition (and (pred_6 ?v2) (pred_6 ?v3) (pred_12 ?v6) (pred_1 ?v11)
          (pred_2 ?v2 ?v3) (pred_7 ?v6 ?v11)
                   (pred_4 ?v3 ?v11) (pred_3 ?v2) 
                   (pred_9 ?v3) (pred_10 ?v6))
:effect (and  (pred_8 ?v3) (not (pred_9 ?v3))))


(:action op_1
:parameters (?v2 ?v4)
:precondition (and (pred_6 ?v2) (pred_6 ?v4)
               (pred_3 ?v2) (pred_2 ?v2 ?v4) (pred_8 ?v4))
:effect (and (pred_3 ?v4) (not (pred_3 ?v2))))

(:action op_5
:parameters (?v2 ?v6)
:precondition (and (pred_6 ?v2) (pred_12 ?v6) 
                  (pred_3 ?v2) (pred_11 ?v6 ?v2) (pred_5 ))
:effect (and (pred_10 ?v6)
   (not (pred_11 ?v6 ?v2)) (not (pred_5 ))))


(:action op_2
:parameters (?v2 ?v10 ?v7)
:precondition (and (pred_6 ?v2) (pred_12 ?v10) (pred_12 ?v7)
                  (pred_3 ?v2) (pred_10 ?v7) (pred_11 ?v10 ?v2))
:effect (and (pred_10 ?v10) (pred_11 ?v7 ?v2)
        (not (pred_10 ?v7)) (not (pred_11 ?v10 ?v2))))

(:action op_3
:parameters (?v2 ?v6)
:precondition (and (pred_6 ?v2) (pred_12 ?v6) 
                  (pred_3 ?v2) (pred_10 ?v6))
:effect (and (pred_5 ) (pred_11 ?v6 ?v2) (not (pred_10 ?v6)))))


	
