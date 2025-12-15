; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1229132761 --problem-name spanner-s3-n3-l4-s1229132761
(define (problem spanner-s3-n3-l4-s1229132761)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_09 obj_02 obj_07 - type_2
     obj_12 obj_04 obj_13 - type_5
     obj_03 obj_11 obj_08 obj_05 - type_3
     obj_10 obj_06 - type_3
    )
 (:init 
    (pred_3 obj_01 obj_10)
    (pred_3 obj_09 obj_08)
    (pred_1 obj_09)
    (pred_3 obj_02 obj_08)
    (pred_1 obj_02)
    (pred_3 obj_07 obj_03)
    (pred_1 obj_07)
    (pred_6 obj_12)
    (pred_3 obj_12 obj_06)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_06)
    (pred_6 obj_13)
    (pred_3 obj_13 obj_06)
    (pred_5 obj_10 obj_03)
    (pred_5 obj_05 obj_06)
    (pred_5 obj_03 obj_11)
    (pred_5 obj_11 obj_08)
    (pred_5 obj_08 obj_05)
)
 (:goal
  (and
   (pred_2 obj_12)
   (pred_2 obj_04)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_04)) (not (pred_2 obj_13))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_10)))
  )
)
)
