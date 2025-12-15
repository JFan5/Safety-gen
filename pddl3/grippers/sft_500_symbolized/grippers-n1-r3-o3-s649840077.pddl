(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_06 - type_2
obj_02 obj_04 - type_1
obj_08 obj_01 obj_05 - type_3
obj_07 obj_03 obj_09 - object)
(:init
(pred_3 obj_06 obj_01)
(pred_1 obj_06 obj_02)
(pred_1 obj_06 obj_04)
(pred_2 obj_07 obj_01)
(pred_2 obj_03 obj_01)
(pred_2 obj_09 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_01)
(pred_2 obj_03 obj_08)
(pred_2 obj_09 obj_08)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_06 ?b obj_04))))
)
)