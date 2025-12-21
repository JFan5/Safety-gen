; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 603921898 --problem-name spanner-s2-n2-l3-s603921898
(define (problem spanner-s2-n2-l3-s603921898)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_01 obj_09 - type_5
     obj_06 obj_10 - type_4
     obj_05 obj_03 obj_08 - type_2
     obj_04 obj_02 - type_2
    )
 (:init 
    (pred_2 obj_07 obj_04)
    (pred_2 obj_01 obj_08)
    (pred_1 obj_01)
    (pred_2 obj_09 obj_05)
    (pred_1 obj_09)
    (pred_5 obj_06)
    (pred_2 obj_06 obj_02)
    (pred_5 obj_10)
    (pred_2 obj_10 obj_02)
    (pred_6 obj_04 obj_05)
    (pred_6 obj_08 obj_02)
    (pred_6 obj_05 obj_03)
    (pred_6 obj_03 obj_08)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_10))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_04)))
  )
)
)
