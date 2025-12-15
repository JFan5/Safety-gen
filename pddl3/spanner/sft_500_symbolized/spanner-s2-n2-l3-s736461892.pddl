; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 736461892 --problem-name spanner-s2-n2-l3-s736461892
(define (problem spanner-s2-n2-l3-s736461892)
 (:domain spanner)
 (:objects 
     obj_01 - type_1
     obj_09 obj_02 - type_4
     obj_04 obj_07 - type_3
     obj_06 obj_05 obj_10 - type_5
     obj_03 obj_08 - type_5
    )
 (:init 
    (pred_3 obj_01 obj_03)
    (pred_3 obj_09 obj_10)
    (pred_1 obj_09)
    (pred_3 obj_02 obj_10)
    (pred_1 obj_02)
    (pred_6 obj_04)
    (pred_3 obj_04 obj_08)
    (pred_6 obj_07)
    (pred_3 obj_07 obj_08)
    (pred_4 obj_03 obj_06)
    (pred_4 obj_10 obj_08)
    (pred_4 obj_06 obj_05)
    (pred_4 obj_05 obj_10)
)
 (:goal
  (and
   (pred_5 obj_04)
   (pred_5 obj_07)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_04)) (not (pred_5 obj_07))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_03)))
  )
)
)
