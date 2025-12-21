(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_1 ?v12 ?v1)
             (pred_3 ?v5 ?v8)
             (pred_6 ?v12 ?v8)
             (pred_11 ?v9 ?v12 )
	     (pred_9 ?v12)
             (pred_10 ?v13)
             (pred_12 ?v5)
             (pred_4 ?v8)
             (pred_8 ?v12)
             (pred_7 ?v5)
             (pred_5 ?v12)
             (pred_2 ))



(:action op_2
:parameters (?v7 ?v3 ?v4 ?v11)
:precondition (and (pred_10 ?v7) (pred_10 ?v3) (pred_12 ?v4) (pred_4 ?v11)
          (pred_1 ?v7 ?v3) (pred_3 ?v4 ?v11)
                   (pred_6 ?v3 ?v11) (pred_9 ?v7) 
                   (pred_8 ?v3) (pred_7 ?v4))
:effect (and  (pred_5 ?v3) (not (pred_8 ?v3))))


(:action op_4
:parameters (?v7 ?v6)
:precondition (and (pred_10 ?v7) (pred_10 ?v6)
               (pred_9 ?v7) (pred_1 ?v7 ?v6) (pred_5 ?v6))
:effect (and (pred_9 ?v6) (not (pred_9 ?v7))))

(:action op_5
:parameters (?v7 ?v4)
:precondition (and (pred_10 ?v7) (pred_12 ?v4) 
                  (pred_9 ?v7) (pred_11 ?v4 ?v7) (pred_2 ))
:effect (and (pred_7 ?v4)
   (not (pred_11 ?v4 ?v7)) (not (pred_2 ))))


(:action op_3
:parameters (?v7 ?v10 ?v2)
:precondition (and (pred_10 ?v7) (pred_12 ?v10) (pred_12 ?v2)
                  (pred_9 ?v7) (pred_7 ?v2) (pred_11 ?v10 ?v7))
:effect (and (pred_7 ?v10) (pred_11 ?v2 ?v7)
        (not (pred_7 ?v2)) (not (pred_11 ?v10 ?v7))))

(:action op_1
:parameters (?v7 ?v4)
:precondition (and (pred_10 ?v7) (pred_12 ?v4) 
                  (pred_9 ?v7) (pred_7 ?v4))
:effect (and (pred_2 ) (pred_11 ?v4 ?v7) (not (pred_7 ?v4)))))


	
