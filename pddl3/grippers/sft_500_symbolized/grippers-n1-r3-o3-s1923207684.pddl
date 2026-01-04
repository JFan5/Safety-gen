(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_2
obj_02 obj_04 - type_3
obj_08 obj_01 obj_05 - type_1
obj_07 obj_06 obj_09 - object)
(:init
(pred_2 obj_03 obj_01)
(pred_3 obj_03 obj_02)
(pred_3 obj_03 obj_04)
(pred_1 obj_07 obj_08)
(pred_1 obj_06 obj_08)
(pred_1 obj_09 obj_01)
)
(:goal
(and
(pred_1 obj_07 obj_05)
(pred_1 obj_06 obj_01)
(pred_1 obj_09 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_03 ?b obj_04))))
)
)