; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1550208098 --problem-name spanner-s3-n2-l4-s1550208098
(define (problem spanner-s3-n2-l4-s1550208098)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_04 obj_07 obj_06 - type_3
     obj_02 obj_10 - type_4
     obj_08 obj_01 obj_12 obj_09 - type_5
     obj_03 obj_11 - type_5
    )
 (:init 
    (pred_3 obj_05 obj_03)
    (pred_3 obj_04 obj_12)
    (pred_4 obj_04)
    (pred_3 obj_07 obj_01)
    (pred_4 obj_07)
    (pred_3 obj_06 obj_12)
    (pred_4 obj_06)
    (pred_6 obj_02)
    (pred_3 obj_02 obj_11)
    (pred_6 obj_10)
    (pred_3 obj_10 obj_11)
    (pred_2 obj_03 obj_08)
    (pred_2 obj_09 obj_11)
    (pred_2 obj_08 obj_01)
    (pred_2 obj_01 obj_12)
    (pred_2 obj_12 obj_09)
)
 (:goal
  (and
   (pred_5 obj_02)
   (pred_5 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_02)) (not (pred_5 obj_10))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
