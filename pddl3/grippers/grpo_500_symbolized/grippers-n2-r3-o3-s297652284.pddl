(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_1
obj_01 obj_05 obj_08 obj_07 - type_3
obj_12 obj_10 obj_04 - type_2
obj_06 obj_11 obj_02 - object)
(:init
(pred_4 obj_03 obj_10)
(pred_2 obj_03 obj_01)
(pred_2 obj_03 obj_05)
(pred_4 obj_09 obj_12)
(pred_2 obj_09 obj_08)
(pred_2 obj_09 obj_07)
(pred_3 obj_06 obj_04)
(pred_3 obj_11 obj_04)
(pred_3 obj_02 obj_04)
)
(:goal
(and
(pred_3 obj_06 obj_10)
(pred_3 obj_11 obj_04)
(pred_3 obj_02 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_04) (pred_4 obj_09 obj_04))))
  )
)
)