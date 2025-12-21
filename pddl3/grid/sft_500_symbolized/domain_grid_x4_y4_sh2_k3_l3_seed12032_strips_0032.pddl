(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v9 ?v10)
             (pred_12 ?v12 ?v8)
             (pred_9 ?v9 ?v8)
             (pred_2 ?v5 ?v9 )
	     (pred_5 ?v9)
             (pred_10 ?v6)
             (pred_1 ?v12)
             (pred_11 ?v8)
             (pred_4 ?v9)
             (pred_3 ?v12)
             (pred_8 ?v9)
             (pred_7 ))



(:action op_1
:parameters (?v2 ?v3 ?v4 ?v1)
:precondition (and (pred_10 ?v2) (pred_10 ?v3) (pred_1 ?v4) (pred_11 ?v1)
          (pred_6 ?v2 ?v3) (pred_12 ?v4 ?v1)
                   (pred_9 ?v3 ?v1) (pred_5 ?v2) 
                   (pred_4 ?v3) (pred_3 ?v4))
:effect (and  (pred_8 ?v3) (not (pred_4 ?v3))))


(:action op_2
:parameters (?v2 ?v7)
:precondition (and (pred_10 ?v2) (pred_10 ?v7)
               (pred_5 ?v2) (pred_6 ?v2 ?v7) (pred_8 ?v7))
:effect (and (pred_5 ?v7) (not (pred_5 ?v2))))

(:action op_3
:parameters (?v2 ?v4)
:precondition (and (pred_10 ?v2) (pred_1 ?v4) 
                  (pred_5 ?v2) (pred_2 ?v4 ?v2) (pred_7 ))
:effect (and (pred_3 ?v4)
   (not (pred_2 ?v4 ?v2)) (not (pred_7 ))))


(:action op_5
:parameters (?v2 ?v11 ?v13)
:precondition (and (pred_10 ?v2) (pred_1 ?v11) (pred_1 ?v13)
                  (pred_5 ?v2) (pred_3 ?v13) (pred_2 ?v11 ?v2))
:effect (and (pred_3 ?v11) (pred_2 ?v13 ?v2)
        (not (pred_3 ?v13)) (not (pred_2 ?v11 ?v2))))

(:action op_4
:parameters (?v2 ?v4)
:precondition (and (pred_10 ?v2) (pred_1 ?v4) 
                  (pred_5 ?v2) (pred_3 ?v4))
:effect (and (pred_7 ) (pred_2 ?v4 ?v2) (not (pred_3 ?v4)))))


	
