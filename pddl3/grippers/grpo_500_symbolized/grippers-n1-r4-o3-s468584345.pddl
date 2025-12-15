(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_08 - type_1
obj_07 obj_06 - type_3
obj_10 obj_04 obj_05 obj_01 - type_2
obj_02 obj_09 obj_03 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_4 obj_08 obj_07)
(pred_4 obj_08 obj_06)
(pred_2 obj_02 obj_10)
(pred_2 obj_09 obj_04)
(pred_2 obj_03 obj_01)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_09 obj_10)
(pred_2 obj_03 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_08 ?b obj_06))))
)
)