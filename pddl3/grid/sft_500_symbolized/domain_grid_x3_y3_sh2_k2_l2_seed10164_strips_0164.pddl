(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_10 ?v11 ?v5)
             (pred_4 ?v2 ?v1)
             (pred_9 ?v11 ?v1)
             (pred_11 ?v3 ?v11 )
	     (pred_8 ?v11)
             (pred_5 ?v8)
             (pred_7 ?v2)
             (pred_6 ?v1)
             (pred_12 ?v11)
             (pred_2 ?v2)
             (pred_1 ?v11)
             (pred_3 ))



(:action op_5
:parameters (?v6 ?v10 ?v12 ?v7)
:precondition (and (pred_5 ?v6) (pred_5 ?v10) (pred_7 ?v12) (pred_6 ?v7)
          (pred_10 ?v6 ?v10) (pred_4 ?v12 ?v7)
                   (pred_9 ?v10 ?v7) (pred_8 ?v6) 
                   (pred_12 ?v10) (pred_2 ?v12))
:effect (and  (pred_1 ?v10) (not (pred_12 ?v10))))


(:action op_3
:parameters (?v6 ?v4)
:precondition (and (pred_5 ?v6) (pred_5 ?v4)
               (pred_8 ?v6) (pred_10 ?v6 ?v4) (pred_1 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v6))))

(:action op_2
:parameters (?v6 ?v12)
:precondition (and (pred_5 ?v6) (pred_7 ?v12) 
                  (pred_8 ?v6) (pred_11 ?v12 ?v6) (pred_3 ))
:effect (and (pred_2 ?v12)
   (not (pred_11 ?v12 ?v6)) (not (pred_3 ))))


(:action op_1
:parameters (?v6 ?v9 ?v13)
:precondition (and (pred_5 ?v6) (pred_7 ?v9) (pred_7 ?v13)
                  (pred_8 ?v6) (pred_2 ?v13) (pred_11 ?v9 ?v6))
:effect (and (pred_2 ?v9) (pred_11 ?v13 ?v6)
        (not (pred_2 ?v13)) (not (pred_11 ?v9 ?v6))))

(:action op_4
:parameters (?v6 ?v12)
:precondition (and (pred_5 ?v6) (pred_7 ?v12) 
                  (pred_8 ?v6) (pred_2 ?v12))
:effect (and (pred_3 ) (pred_11 ?v12 ?v6) (not (pred_2 ?v12)))))


	
