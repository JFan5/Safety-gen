(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_06 - type_1
obj_04 obj_01 - type_2
obj_05 obj_07 obj_03 obj_02 - type_3
obj_10 obj_08 obj_09 - object)
(:init
(pred_1 obj_06 obj_05)
(pred_3 obj_06 obj_04)
(pred_3 obj_06 obj_01)
(pred_2 obj_10 obj_05)
(pred_2 obj_08 obj_07)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_10 obj_02)
(pred_2 obj_08 obj_05)
(pred_2 obj_09 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_01))))
)
)