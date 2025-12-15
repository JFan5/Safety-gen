; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 324440695 --problem-name spanner-s2-n2-l3-s324440695
(define (problem spanner-s2-n2-l3-s324440695)
 (:domain spanner)
 (:objects 
     obj_08 - type_1
     obj_03 obj_02 - type_4
     obj_06 obj_07 - type_3
     obj_09 obj_04 obj_05 - type_2
     obj_10 obj_01 - type_2
    )
 (:init 
    (pred_5 obj_08 obj_10)
    (pred_5 obj_03 obj_09)
    (pred_6 obj_03)
    (pred_5 obj_02 obj_09)
    (pred_6 obj_02)
    (pred_1 obj_06)
    (pred_5 obj_06 obj_01)
    (pred_1 obj_07)
    (pred_5 obj_07 obj_01)
    (pred_4 obj_10 obj_09)
    (pred_4 obj_05 obj_01)
    (pred_4 obj_09 obj_04)
    (pred_4 obj_04 obj_05)
)
 (:goal
  (and
   (pred_3 obj_06)
   (pred_3 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_06)) (not (pred_3 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_5 ?m obj_10)))
  )
)
)
