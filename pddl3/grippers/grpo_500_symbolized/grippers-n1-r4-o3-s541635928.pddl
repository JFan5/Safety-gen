(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_03 obj_02 - type_3
obj_10 obj_09 obj_07 obj_01 - type_2
obj_05 obj_08 obj_06 - object)
(:init
(pred_4 obj_04 obj_07)
(pred_2 obj_04 obj_03)
(pred_2 obj_04 obj_02)
(pred_3 obj_05 obj_10)
(pred_3 obj_08 obj_10)
(pred_3 obj_06 obj_01)
)
(:goal
(and
(pred_3 obj_05 obj_10)
(pred_3 obj_08 obj_10)
(pred_3 obj_06 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_02))))
)
)