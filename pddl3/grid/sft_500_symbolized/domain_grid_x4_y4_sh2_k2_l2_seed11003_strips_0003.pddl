(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_6 ?v7 ?v9)
             (pred_1 ?v5 ?v8)
             (pred_12 ?v7 ?v8)
             (pred_2 ?v10 ?v7 )
	     (pred_7 ?v7)
             (pred_11 ?v13)
             (pred_3 ?v5)
             (pred_8 ?v8)
             (pred_4 ?v7)
             (pred_5 ?v5)
             (pred_10 ?v7)
             (pred_9 ))



(:action op_4
:parameters (?v6 ?v1 ?v3 ?v11)
:precondition (and (pred_11 ?v6) (pred_11 ?v1) (pred_3 ?v3) (pred_8 ?v11)
          (pred_6 ?v6 ?v1) (pred_1 ?v3 ?v11)
                   (pred_12 ?v1 ?v11) (pred_7 ?v6) 
                   (pred_4 ?v1) (pred_5 ?v3))
:effect (and  (pred_10 ?v1) (not (pred_4 ?v1))))


(:action op_2
:parameters (?v6 ?v4)
:precondition (and (pred_11 ?v6) (pred_11 ?v4)
               (pred_7 ?v6) (pred_6 ?v6 ?v4) (pred_10 ?v4))
:effect (and (pred_7 ?v4) (not (pred_7 ?v6))))

(:action op_1
:parameters (?v6 ?v3)
:precondition (and (pred_11 ?v6) (pred_3 ?v3) 
                  (pred_7 ?v6) (pred_2 ?v3 ?v6) (pred_9 ))
:effect (and (pred_5 ?v3)
   (not (pred_2 ?v3 ?v6)) (not (pred_9 ))))


(:action op_3
:parameters (?v6 ?v12 ?v2)
:precondition (and (pred_11 ?v6) (pred_3 ?v12) (pred_3 ?v2)
                  (pred_7 ?v6) (pred_5 ?v2) (pred_2 ?v12 ?v6))
:effect (and (pred_5 ?v12) (pred_2 ?v2 ?v6)
        (not (pred_5 ?v2)) (not (pred_2 ?v12 ?v6))))

(:action op_5
:parameters (?v6 ?v3)
:precondition (and (pred_11 ?v6) (pred_3 ?v3) 
                  (pred_7 ?v6) (pred_5 ?v3))
:effect (and (pred_9 ) (pred_2 ?v3 ?v6) (not (pred_5 ?v3)))))


	
