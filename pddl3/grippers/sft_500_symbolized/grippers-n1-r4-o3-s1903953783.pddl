(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_05 obj_03 - type_2
obj_07 obj_06 obj_01 obj_04 - type_3
obj_02 obj_08 obj_09 - object)
(:init
(pred_2 obj_10 obj_01)
(pred_3 obj_10 obj_05)
(pred_3 obj_10 obj_03)
(pred_1 obj_02 obj_07)
(pred_1 obj_08 obj_04)
(pred_1 obj_09 obj_07)
)
(:goal
(and
(pred_1 obj_02 obj_04)
(pred_1 obj_08 obj_06)
(pred_1 obj_09 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_10 ?b obj_03))))
)
)