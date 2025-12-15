(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_04 obj_02 - type_3
obj_03 obj_01 obj_05 obj_06 - type_2
obj_09 obj_10 obj_07 - object)
(:init
(pred_3 obj_08 obj_05)
(pred_4 obj_08 obj_04)
(pred_4 obj_08 obj_02)
(pred_2 obj_09 obj_01)
(pred_2 obj_10 obj_01)
(pred_2 obj_07 obj_01)
)
(:goal
(and
(pred_2 obj_09 obj_03)
(pred_2 obj_10 obj_06)
(pred_2 obj_07 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_02))))
)
)