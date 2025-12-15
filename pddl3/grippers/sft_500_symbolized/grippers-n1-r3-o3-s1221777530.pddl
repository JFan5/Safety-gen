(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_3
obj_09 obj_04 - type_1
obj_06 obj_08 obj_05 - type_2
obj_01 obj_07 obj_02 - object)
(:init
(pred_4 obj_03 obj_06)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_04)
(pred_1 obj_01 obj_06)
(pred_1 obj_07 obj_08)
(pred_1 obj_02 obj_05)
)
(:goal
(and
(pred_1 obj_01 obj_08)
(pred_1 obj_07 obj_08)
(pred_1 obj_02 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_03 ?b obj_04))))
)
)