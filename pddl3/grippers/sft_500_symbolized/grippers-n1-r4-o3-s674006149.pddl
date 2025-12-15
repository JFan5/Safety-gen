(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_1
obj_02 obj_01 - type_3
obj_06 obj_07 obj_05 obj_08 - type_2
obj_10 obj_09 obj_03 - object)
(:init
(pred_2 obj_04 obj_07)
(pred_1 obj_04 obj_02)
(pred_1 obj_04 obj_01)
(pred_3 obj_10 obj_08)
(pred_3 obj_09 obj_05)
(pred_3 obj_03 obj_07)
)
(:goal
(and
(pred_3 obj_10 obj_05)
(pred_3 obj_09 obj_05)
(pred_3 obj_03 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_04 ?b obj_01))))
)
)