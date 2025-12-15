(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_5 ?v2 ?v8)
             (pred_7 ?v11 ?v4)
             (pred_12 ?v2 ?v4)
             (pred_11 ?v9 ?v2 )
	     (pred_3 ?v2)
             (pred_2 ?v12)
             (pred_4 ?v11)
             (pred_9 ?v4)
             (pred_6 ?v2)
             (pred_10 ?v11)
             (pred_1 ?v2)
             (pred_8 ))



(:action op_2
:parameters (?v10 ?v13 ?v3 ?v5)
:precondition (and (pred_2 ?v10) (pred_2 ?v13) (pred_4 ?v3) (pred_9 ?v5)
          (pred_5 ?v10 ?v13) (pred_7 ?v3 ?v5)
                   (pred_12 ?v13 ?v5) (pred_3 ?v10) 
                   (pred_6 ?v13) (pred_10 ?v3))
:effect (and  (pred_1 ?v13) (not (pred_6 ?v13))))


(:action op_5
:parameters (?v10 ?v1)
:precondition (and (pred_2 ?v10) (pred_2 ?v1)
               (pred_3 ?v10) (pred_5 ?v10 ?v1) (pred_1 ?v1))
:effect (and (pred_3 ?v1) (not (pred_3 ?v10))))

(:action op_1
:parameters (?v10 ?v3)
:precondition (and (pred_2 ?v10) (pred_4 ?v3) 
                  (pred_3 ?v10) (pred_11 ?v3 ?v10) (pred_8 ))
:effect (and (pred_10 ?v3)
   (not (pred_11 ?v3 ?v10)) (not (pred_8 ))))


(:action op_4
:parameters (?v10 ?v7 ?v6)
:precondition (and (pred_2 ?v10) (pred_4 ?v7) (pred_4 ?v6)
                  (pred_3 ?v10) (pred_10 ?v6) (pred_11 ?v7 ?v10))
:effect (and (pred_10 ?v7) (pred_11 ?v6 ?v10)
        (not (pred_10 ?v6)) (not (pred_11 ?v7 ?v10))))

(:action op_3
:parameters (?v10 ?v3)
:precondition (and (pred_2 ?v10) (pred_4 ?v3) 
                  (pred_3 ?v10) (pred_10 ?v3))
:effect (and (pred_8 ) (pred_11 ?v3 ?v10) (not (pred_10 ?v3)))))


	
