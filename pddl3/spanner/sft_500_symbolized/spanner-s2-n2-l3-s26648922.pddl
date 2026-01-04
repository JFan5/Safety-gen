; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 26648922 --problem-name spanner-s2-n2-l3-s26648922
(define (problem spanner-s2-n2-l3-s26648922)
 (:domain spanner)
 (:objects 
     obj_06 - type_2
     obj_10 obj_05 - type_1
     obj_08 obj_02 - type_3
     obj_01 obj_03 obj_07 - type_5
     obj_09 obj_04 - type_5
    )
 (:init 
    (pred_3 obj_06 obj_09)
    (pred_3 obj_10 obj_07)
    (pred_2 obj_10)
    (pred_3 obj_05 obj_01)
    (pred_2 obj_05)
    (pred_1 obj_08)
    (pred_3 obj_08 obj_04)
    (pred_1 obj_02)
    (pred_3 obj_02 obj_04)
    (pred_6 obj_09 obj_01)
    (pred_6 obj_07 obj_04)
    (pred_6 obj_01 obj_03)
    (pred_6 obj_03 obj_07)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_02))))
    (forall (?m - type_2) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
