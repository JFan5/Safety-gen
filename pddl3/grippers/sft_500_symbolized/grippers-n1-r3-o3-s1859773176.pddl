(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_05 obj_03 - type_3
obj_06 obj_04 obj_09 - type_2
obj_07 obj_01 obj_08 - object)
(:init
(pred_2 obj_02 obj_04)
(pred_4 obj_02 obj_05)
(pred_4 obj_02 obj_03)
(pred_1 obj_07 obj_04)
(pred_1 obj_01 obj_06)
(pred_1 obj_08 obj_04)
)
(:goal
(and
(pred_1 obj_07 obj_06)
(pred_1 obj_01 obj_06)
(pred_1 obj_08 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_02 ?b obj_03))))
)
)