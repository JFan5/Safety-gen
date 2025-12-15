(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_06 obj_01 - type_1
obj_05 obj_08 obj_03 obj_07 - type_2
obj_09 obj_02 obj_10 - object)
(:init
(pred_2 obj_04 obj_08)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_01)
(pred_4 obj_09 obj_05)
(pred_4 obj_02 obj_05)
(pred_4 obj_10 obj_07)
)
(:goal
(and
(pred_4 obj_09 obj_05)
(pred_4 obj_02 obj_07)
(pred_4 obj_10 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_04 ?b obj_01))))
)
)