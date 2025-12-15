(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v11 ?v12)
             (pred_10 ?v1 ?v4)
             (pred_4 ?v11 ?v4)
             (pred_9 ?v8 ?v11 )
	     (pred_8 ?v11)
             (pred_7 ?v13)
             (pred_3 ?v1)
             (pred_5 ?v4)
             (pred_1 ?v11)
             (pred_11 ?v1)
             (pred_2 ?v11)
             (pred_12 ))



(:action op_5
:parameters (?v3 ?v7 ?v6 ?v9)
:precondition (and (pred_7 ?v3) (pred_7 ?v7) (pred_3 ?v6) (pred_5 ?v9)
          (pred_6 ?v3 ?v7) (pred_10 ?v6 ?v9)
                   (pred_4 ?v7 ?v9) (pred_8 ?v3) 
                   (pred_1 ?v7) (pred_11 ?v6))
:effect (and  (pred_2 ?v7) (not (pred_1 ?v7))))


(:action op_1
:parameters (?v3 ?v2)
:precondition (and (pred_7 ?v3) (pred_7 ?v2)
               (pred_8 ?v3) (pred_6 ?v3 ?v2) (pred_2 ?v2))
:effect (and (pred_8 ?v2) (not (pred_8 ?v3))))

(:action op_4
:parameters (?v3 ?v6)
:precondition (and (pred_7 ?v3) (pred_3 ?v6) 
                  (pred_8 ?v3) (pred_9 ?v6 ?v3) (pred_12 ))
:effect (and (pred_11 ?v6)
   (not (pred_9 ?v6 ?v3)) (not (pred_12 ))))


(:action op_3
:parameters (?v3 ?v5 ?v10)
:precondition (and (pred_7 ?v3) (pred_3 ?v5) (pred_3 ?v10)
                  (pred_8 ?v3) (pred_11 ?v10) (pred_9 ?v5 ?v3))
:effect (and (pred_11 ?v5) (pred_9 ?v10 ?v3)
        (not (pred_11 ?v10)) (not (pred_9 ?v5 ?v3))))

(:action op_2
:parameters (?v3 ?v6)
:precondition (and (pred_7 ?v3) (pred_3 ?v6) 
                  (pred_8 ?v3) (pred_11 ?v6))
:effect (and (pred_12 ) (pred_9 ?v6 ?v3) (not (pred_11 ?v6)))))


	
