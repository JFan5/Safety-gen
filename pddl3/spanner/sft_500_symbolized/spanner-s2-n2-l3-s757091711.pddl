; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 757091711 --problem-name spanner-s2-n2-l3-s757091711
(define (problem spanner-s2-n2-l3-s757091711)
 (:domain spanner)
 (:objects 
     obj_07 - type_1
     obj_02 obj_03 - type_5
     obj_08 obj_01 - type_3
     obj_04 obj_06 obj_05 - type_4
     obj_10 obj_09 - type_4
    )
 (:init 
    (pred_6 obj_07 obj_10)
    (pred_6 obj_02 obj_05)
    (pred_1 obj_02)
    (pred_6 obj_03 obj_04)
    (pred_1 obj_03)
    (pred_3 obj_08)
    (pred_6 obj_08 obj_09)
    (pred_3 obj_01)
    (pred_6 obj_01 obj_09)
    (pred_2 obj_10 obj_04)
    (pred_2 obj_05 obj_09)
    (pred_2 obj_04 obj_06)
    (pred_2 obj_06 obj_05)
)
 (:goal
  (and
   (pred_5 obj_08)
   (pred_5 obj_01)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_08)) (not (pred_5 obj_01))))
    (forall (?m - type_1) (at-most-once (pred_6 ?m obj_10)))
  )
)
)
