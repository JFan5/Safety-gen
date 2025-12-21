(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_3 ?v12 ?v2)
             (pred_1 ?v9 ?v8)
             (pred_10 ?v12 ?v8)
             (pred_7 ?v4 ?v12 )
	     (pred_4 ?v12)
             (pred_12 ?v7)
             (pred_8 ?v9)
             (pred_9 ?v8)
             (pred_11 ?v12)
             (pred_6 ?v9)
             (pred_5 ?v12)
             (pred_2 ))



(:action op_2
:parameters (?v6 ?v10 ?v3 ?v1)
:precondition (and (pred_12 ?v6) (pred_12 ?v10) (pred_8 ?v3) (pred_9 ?v1)
          (pred_3 ?v6 ?v10) (pred_1 ?v3 ?v1)
                   (pred_10 ?v10 ?v1) (pred_4 ?v6) 
                   (pred_11 ?v10) (pred_6 ?v3))
:effect (and  (pred_5 ?v10) (not (pred_11 ?v10))))


(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_12 ?v6) (pred_12 ?v11)
               (pred_4 ?v6) (pred_3 ?v6 ?v11) (pred_5 ?v11))
:effect (and (pred_4 ?v11) (not (pred_4 ?v6))))

(:action op_3
:parameters (?v6 ?v3)
:precondition (and (pred_12 ?v6) (pred_8 ?v3) 
                  (pred_4 ?v6) (pred_7 ?v3 ?v6) (pred_2 ))
:effect (and (pred_6 ?v3)
   (not (pred_7 ?v3 ?v6)) (not (pred_2 ))))


(:action op_1
:parameters (?v6 ?v13 ?v5)
:precondition (and (pred_12 ?v6) (pred_8 ?v13) (pred_8 ?v5)
                  (pred_4 ?v6) (pred_6 ?v5) (pred_7 ?v13 ?v6))
:effect (and (pred_6 ?v13) (pred_7 ?v5 ?v6)
        (not (pred_6 ?v5)) (not (pred_7 ?v13 ?v6))))

(:action op_4
:parameters (?v6 ?v3)
:precondition (and (pred_12 ?v6) (pred_8 ?v3) 
                  (pred_4 ?v6) (pred_6 ?v3))
:effect (and (pred_2 ) (pred_7 ?v3 ?v6) (not (pred_6 ?v3)))))


	
