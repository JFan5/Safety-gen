(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_07 - type_2
obj_08 obj_04 - type_3
obj_05 obj_09 obj_01 - type_1
obj_03 obj_06 obj_02 - object)
(:init
(pred_2 obj_07 obj_01)
(pred_1 obj_07 obj_08)
(pred_1 obj_07 obj_04)
(pred_4 obj_03 obj_01)
(pred_4 obj_06 obj_05)
(pred_4 obj_02 obj_01)
)
(:goal
(and
(pred_4 obj_03 obj_05)
(pred_4 obj_06 obj_01)
(pred_4 obj_02 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_07 ?b obj_04))))
)
)