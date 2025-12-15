; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1546595130 --problem-name spanner-s2-n2-l3-s1546595130
(define (problem spanner-s2-n2-l3-s1546595130)
 (:domain spanner)
 (:objects 
     obj_07 - type_3
     obj_06 obj_08 - type_4
     obj_03 obj_05 - type_1
     obj_10 obj_09 obj_02 - type_5
     obj_01 obj_04 - type_5
    )
 (:init 
    (pred_4 obj_07 obj_01)
    (pred_4 obj_06 obj_09)
    (pred_3 obj_06)
    (pred_4 obj_08 obj_10)
    (pred_3 obj_08)
    (pred_5 obj_03)
    (pred_4 obj_03 obj_04)
    (pred_5 obj_05)
    (pred_4 obj_05 obj_04)
    (pred_1 obj_01 obj_10)
    (pred_1 obj_02 obj_04)
    (pred_1 obj_10 obj_09)
    (pred_1 obj_09 obj_02)
)
 (:goal
  (and
   (pred_6 obj_03)
   (pred_6 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_03)) (not (pred_6 obj_05))))
    (forall (?m - type_3) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
