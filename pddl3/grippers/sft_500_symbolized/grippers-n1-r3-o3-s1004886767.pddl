(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_09 - type_3
obj_05 obj_04 - type_2
obj_01 obj_07 obj_06 - type_1
obj_03 obj_08 obj_02 - object)
(:init
(pred_2 obj_09 obj_01)
(pred_3 obj_09 obj_05)
(pred_3 obj_09 obj_04)
(pred_4 obj_03 obj_07)
(pred_4 obj_08 obj_01)
(pred_4 obj_02 obj_06)
)
(:goal
(and
(pred_4 obj_03 obj_01)
(pred_4 obj_08 obj_07)
(pred_4 obj_02 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_04))))
)
)