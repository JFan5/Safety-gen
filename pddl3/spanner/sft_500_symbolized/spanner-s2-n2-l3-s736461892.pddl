; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 736461892 --problem-name spanner-s2-n2-l3-s736461892
(define (problem spanner-s2-n2-l3-s736461892)
 (:domain spanner)
 (:objects 
     obj_05 - type_4
     obj_04 obj_06 - type_3
     obj_03 obj_10 - type_5
     obj_02 obj_07 obj_08 - type_2
     obj_09 obj_01 - type_2
    )
 (:init 
    (pred_6 obj_05 obj_09)
    (pred_6 obj_04 obj_08)
    (pred_5 obj_04)
    (pred_6 obj_06 obj_08)
    (pred_5 obj_06)
    (pred_3 obj_03)
    (pred_6 obj_03 obj_01)
    (pred_3 obj_10)
    (pred_6 obj_10 obj_01)
    (pred_1 obj_09 obj_02)
    (pred_1 obj_08 obj_01)
    (pred_1 obj_02 obj_07)
    (pred_1 obj_07 obj_08)
)
 (:goal
  (and
   (pred_4 obj_03)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_03)) (not (pred_4 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_6 ?m obj_09)))
  )
)
)
