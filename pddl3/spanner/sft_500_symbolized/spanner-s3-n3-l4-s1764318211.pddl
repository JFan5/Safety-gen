; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 3 4 --seed 1764318211 --problem-name spanner-s3-n3-l4-s1764318211
(define (problem spanner-s3-n3-l4-s1764318211)
 (:domain spanner)
 (:objects 
     obj_08 - type_4
     obj_04 obj_06 obj_10 - type_1
     obj_02 obj_12 obj_13 - type_5
     obj_03 obj_11 obj_09 obj_05 - type_2
     obj_07 obj_01 - type_2
    )
 (:init 
    (pred_4 obj_08 obj_07)
    (pred_4 obj_04 obj_09)
    (pred_1 obj_04)
    (pred_4 obj_06 obj_11)
    (pred_1 obj_06)
    (pred_4 obj_10 obj_09)
    (pred_1 obj_10)
    (pred_3 obj_02)
    (pred_4 obj_02 obj_01)
    (pred_3 obj_12)
    (pred_4 obj_12 obj_01)
    (pred_3 obj_13)
    (pred_4 obj_13 obj_01)
    (pred_6 obj_07 obj_03)
    (pred_6 obj_05 obj_01)
    (pred_6 obj_03 obj_11)
    (pred_6 obj_11 obj_09)
    (pred_6 obj_09 obj_05)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_12)
   (pred_2 obj_13)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_12)) (not (pred_2 obj_13))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_07)))
  )
)
)
